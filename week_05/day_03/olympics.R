library(shiny)
library(tidyverse)
library(CodeClanData)
library(shinythemes)

olympics_overall_medals <- read_csv("~/CodeClan/d10_classnotes/week_05/day_3/04_shiny_mini_lab/data/olympics_overall_medals.csv")

olympics_overall_medals %>% 
    filter(team %in% c(
        "United States",
        "Soviet Union",
        "Germany",
        "Italy",
        "Great Britain")) %>%
    filter(medal == "medal") %>%
    filter(season == "season") %>%
ggplot() +
    aes(x = team, y = count) +
    geom_col()

ui <- fluidPage(
    
    theme = shinytheme("journal"),
    
    titlePanel(tags$b("Five Country Medal Comparison")),
    
    fluidRow(
        
        column(6,
            
            radioButtons("season",
                tags$b("Summer or Winter Olympics?"),
                choices = c("Summer", "Winter")
                )
        ),
            
        column(6, 
            radioButtons("medal",
                tags$b("Which Medal?"),
                choices = c("Gold", "Silver", "Bronze")
            )
        ),
        
        mainPanel(
            plotOutput("medal_plot")
        )
        
    ),
)

server <- function(input, output){
    
    output$medal_plot <- renderPlot({
        
        olympics_overall_medals %>%
            filter(team %in% c(
                    "United States",
                    "Soviet Union",
                    "Germany",
                    "Italy",
                    "Great Britain")) %>%
            filter(medal == input$medal) %>%
            filter(season == input$season) %>%
        ggplot() +
            aes(x = team, y = count, fill = medal) +
            geom_col () +
            labs(x = "Country", y = "Medal Total") +
            scale_fill_manual(values = c(Gold = "#FFD700",
                                        Silver = "#C0C0C0",
                                        Bronze = "#CD7F32"))
                              
    })
    
}

shinyApp(ui = ui, server = server)
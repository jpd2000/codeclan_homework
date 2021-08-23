library(CodeClanData)
library(shiny)
library(tidyverse)


# Define UI for application that shows ratings for genre/platforms
ui <- fluidPage(

    # Application title
    titlePanel("Highest Rated Games"),

    # Sidebar with radio buttons & slider for platform and genre choices
    sidebarLayout(
        sidebarPanel(
            
           selectInput("platform_input",
                        "Which Platform?",
                        choices = c("3DS", "DS", "GBA", "GC", "PC", "PS", "PS2",
                                    "PS3", "PS4", "PSP", "PSV", "Wii", "WiiU", 
                                    "X360", "XB", "XOne")
                    ),
        
            radioButtons("genre_input",
                    "Genre",
                    choices = c("Action", 
                                "Adventure", 
                                "Fighting", 
                                "Misc", 
                                "Platform", 
                                "Puzzle", 
                                "Racing", 
                                "Role-Playing", 
                                "Shooter", 
                                "Simulation")
                        )
                ),    
        
        # Show a plot of the critic scores
        mainPanel(
           plotOutput("game_rating")
        )
    )
)

# Define server logic required to show data as columns
server <- function(input, output) {
    output$game_rating <- renderPlot({
        
    game_sales %>%
        filter(platform == "input$platform_input") %>%
        filter(genre == "input$genre_input") %>%
        ggplot() +
        aes(x = critic_score) +
        geom_col()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

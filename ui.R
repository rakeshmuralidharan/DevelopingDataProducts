library(shiny)

## Define UI for application that plots crime type with urban population and subsequently
## predicts the selected crime rate for given urban population.
shinyUI(fluidPage(
        titlePanel(
                div(h4("Project using Shiny - Exploration and Prediction of Crime Rates"),
                    style = "color:blue")
                ),
        
        sidebarLayout(
                sidebarPanel(
                        h4("Select options below:"),
                        helpText("Select crime type from below for plot of urban population vs.
                                 crime type..."),
                        selectInput("plotVar", label = "Crime Type", choices = list(
                                "Murder", "Assault", "Rape"), selected = "Murder"),
                        br(),
                        helpText("Specify a value for Urban population (in %) to predict
                                 selected crime rate..."),
                        sliderInput("range", label = "Urban Population Range(%)",
                                    min=0, max=100, value = 65, step = 1)
                        ),
                mainPanel(                   
                        h4("This application uses Violent Crime Rates for US States dataset
                          to explore and predict crime type by urban population using Simple Linear
                           Regression."),
                        br(),
                        textOutput("text1"),
                        textOutput("text2"),
                        plotOutput("plot1"),
                        br(),
                        textOutput("text3"),
                        verbatimTextOutput("predict"),
                        textOutput("text4")
                        )
                
                )
))
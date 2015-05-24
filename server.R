library(shiny)
library(datasets)
library(ggplot2)

## Following code defined the server code for the Shiny application...

shinyServer(function(input, output) {
        ## Chart title
        output$text1 = renderText({
                paste("Urban Population vs. ", input$plotVar)
                    
        })
        ## Reactively read the data and subset by selected variable
        crime.df = reactive({
                USArrests[,colnames(USArrests) %in% c(input$plotVar, "UrbanPop")]
        })
        ## Plot the selected variable vs. the Urban Population rate        
        output$plot1 = renderPlot({
                crime = crime.df()
                p = ggplot(data=crime, aes_string(x="UrbanPop", y=input$plotVar))+geom_point(color="red", size=4) + 
                        geom_smooth(method=lm, se=FALSE)
                print(p)
        })
        ## Use simple linear regression to predict selected crime rate given urban population
        output$text3 = renderText({
                paste("Predicted value for variable ", input$plotVar,  
                      " for Urban Population rate of ",input$range, "(%) is: ")
        })
        ## Perform the regresssion and output prediction
        output$predict = renderPrint({
                crime = crime.df()
                regfit = lm(as.formula(paste(input$plotVar, "~", "UrbanPop")), data=crime)
                predicted = coef(regfit)[1]+(coef(regfit)[2]*(input$range))
                print(round(as.numeric(predicted),2))
                                
        })
        
        output$text4 = renderText({
                paste("(per 100,000)")
        })
        
})
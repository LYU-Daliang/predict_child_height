library(shiny)

df <- read.csv('Galton.csv')
fit_male <- lm(Height ~ Father + Mother, data = df[df$Gender == 'M', ])
fit_female <- lm(Height ~ Father + Mother, data = df[df$Gender == 'F', ])
# alternatively, you can regress on all the variables at once
# fit_all <- lm(Height ~ Father + Mother + Gender, data = df)

shinyServer(
    function(input, output){
        output$ofather_height <- renderPrint({input$father_height})
        output$omother_height <- renderPrint({input$mother_height})
        output$ogender <- renderPrint({input$gender})
        output$ochild_height <- renderPrint({
            fit <-switch(input$gender, M = fit_male,
                         F = fit_female)
            round(predict(fit, newdata = data.frame(
                Father = input$father_height,
                Mother = input$mother_height))[[1]], 1)
            # if you regress on all the variables at once, you should change
            # the above renderPrint() code chunk accordingly
            # round(predict(fit_all, newdata = data.frame(
            #    Father = input$father_height,
            #    Mother = input$mother_height,
            #    Gender = input$gender)), 1)
        })
    }
)

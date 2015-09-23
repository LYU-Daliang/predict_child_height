library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Predicting the Height of Adult Child'),
    sidebarPanel(
        sliderInput('father_height', 'The father\'s height (inches):',
                    value = 69.2,
                    min = 50, max = 90, step = .1),
        sliderInput('mother_height', 'The mother\'s height (inches):',
                    value = 64.1,
                    min = 50, max = 80, step = .1),
        radioButtons("gender", 'The gender of the child:',
                     choices = list("Male" = 'M', "Female" = 'F'),
                     selected = 'M'),
        submitButton('Submit')
    ),
    mainPanel(
        h3('You entered:'),
        p('The father\'s height (inches):'),
        verbatimTextOutput('ofather_height'),
        p('The mother\'s height (inches):'),
        verbatimTextOutput('omother_height'),
        p('The gender of the child:'),
        verbatimTextOutput('ogender'),
        h3('The predicted height (inches) of the child is:'),
        verbatimTextOutput('ochild_height'),

        hr(),
        h3('Instructions:'),
        p('This shiny app aims to predict the height of an adult child based on his/her parent\'s heights and his/her own gender.'),
        p('The app is quite straightforward. On the left, you select the heights (inches) of parents using two sliders, and they both have limitations. Then, you specify the gender with a pair of radio buttons. If you feel comfort with your selections, push the submit button.'),
        p('On the right, after the submit button pushed, the predicted height (inches) of the adult child is calculated and showed for you. Moreover, what you input on the left are displayed for proofreading purpose.'),
        p('The back end of this app is the famous 1885 study of Francis Galton exploring the relationship between the heights of adult children and the heights of their parents. The link below gives the data set in comma-separated text format.'),
        a('Galton\'s Height Data',
            href = 'http://www.math.uah.edu/stat/data/Galton.csv'),
        hr()
    )
))

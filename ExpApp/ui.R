shinyUI(pageWithSidebar(
  headerPanel("Exponential distribution"),
  sidebarPanel(
    p('This app displays n random samples drawn from an exponential distribution with parameter lambda.'),
    p('It was inspired by Project 1 assigned in the Statistical Inference course.'),
    p('Iga Korneta, on August 11, A.D. 2014'),
    p('**********'),
    p(' '),
    p('Please pick a number of random samples (n) and the lambda parameter:'),
    sliderInput('n', 'Number of random samples', value = 100, min=1, max=50000, step=1),
    sliderInput('lambda', 'Lambda', value = 0.5, min=0, max=20, step=0.01),
    checkboxInput("id2", "Show value counts?", FALSE),
    checkboxInput("id3", "Show summary?", FALSE)
  ),
  mainPanel(
    h4("Plot"),
    plotOutput("myExpPlot"),
    h4("Counts"),
    tableOutput("myExpTable"),
    h4("Summary"),
    verbatimTextOutput("summary")
  )
))
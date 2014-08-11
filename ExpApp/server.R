library(ggplot2)
library(shiny)

shinyServer(
  function(input, output) {      
      n <<- reactive ({as.numeric(input$n)})
      lambda <<- reactive ({as.numeric(input$lambda)})
      x <- reactive ({data.frame(samples=rexp(n(), lambda()))})
      
      output$myExpPlot <- renderPlot({    
      p <- ggplot(x(), aes(samples)) + geom_bar(fill="light green") + theme_bw() + xlab("Random samples") + ylab("Count")
      p
      #hist(x, xlab='child height', col='lightblue',main='Histogram')
      #text(63, 150, paste("mu = ", lambda))
      #text(63, 140, paste("MSE = ", round(lambda, 2)))
    })
    
      sumtable <- reactive({
        sumtable <- data.frame(row.names=NULL)
        for (i in levels(as.factor(x()$samples))) {
          sumtable[i,"Values"] <- i
          sumtable[i,"Count"] <- print(sum(x()$samples==i))}
        colnames(sumtable)=c("Values", "Count")
        rownames(sumtable)<-NULL
        sumtable })
    
       output$myExpTable <- renderTable({
           if (input$id2=="TRUE") {sumtable()}
         }) 
    
    
      output$summary <- renderPrint({
        if (input$id3=="TRUE") {summary(x())}
      })

  }
)

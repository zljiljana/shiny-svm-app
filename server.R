#library(UsingR)
library(ggplot2)
library(e1071)

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      set.seed(145)
      n <- input$numData
      shift <- input$shift
      C <- input$C
      gamma <- input$gamma
      posClass <- data.frame(x1=rnorm(n/2,0), x2=rnorm(n/2,0))
      negClass <- data.frame(x1=rnorm(n/2,shift), x2=rnorm(n/2,shift))
      myData <- rbind(posClass,negClass)
      y <- c(rep(1,n/2), rep(-1,n/2))
      myData$y <- as.factor(y)
      model <- svm(y ~ ., data = myData, scale = FALSE, kernel = 'radial', cost = C, gamma = gamma)
      plot(model, myData)
    })
    output$pred <- renderTable({
      set.seed(145)
      n <- input$numData
      shift <- input$shift
      C <- input$C
      gamma <- input$gamma
      posClass <- data.frame(x1=rnorm(n/2,0), x2=rnorm(n/2,0))
      negClass <- data.frame(x1=rnorm(n/2,shift), x2=rnorm(n/2,shift))
      myData <- rbind(posClass,negClass)
      y <- c(rep(1,n/2), rep(-1,n/2))
      myData$y <- as.factor(y)
      model <- svm(y ~ ., data = myData, scale = FALSE, kernel = 'radial', cost = C, gamma = gamma)
      predictions <- predict(model, myData[,-3])
      xtab <- table(pred = predictions, true = myData[,3])
    })
  }
)
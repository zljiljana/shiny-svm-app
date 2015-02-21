shinyUI(pageWithSidebar(
  headerPanel("Support Vector Machine"),
  sidebarPanel(
    sliderInput('numData', 'Number of data points', value = 30, min = 2, max = 100, step = 2,),
    sliderInput('shift', 'Shift between the classes', value = 2, min = 0, max = 5, step = 0.5),
    sliderInput('C', 'Training parameter C', value = 10, min = 0.1, max = 100, step = 0.5),
    sliderInput('gamma', 'Training parameter gamma', value = 1, min = 0.001, max = 20, step = 0.05)
    ),
  mainPanel(
    plotOutput('newPlot'),
    h4("Confusion table: ", align = "left"),
    tableOutput('pred'), 
    h3("Documentation"),
    
    h4("Support Vector Machine"),
    "In this Shiny app we demonstrate the practical use of support vector machine (SVM) classifier.
    SVMs represent a powerful algorithm for both linear and nonlinear classification, regression and outlier detection with an intuitive graphical model representation.",
    h4("What does this app show"),
    "To demonstrate how SVM works it is easiest to do it in low-dimensional input space, that is why this app is made in 2D. 
    The app first plots the data points based on the number of points and shift between the classes that the user inputs via the sliders. 
    Then we use nonlinear SVM model to perform the training on the data and show the separation line between two classes denoted as -1 and 1.
    You may notice on the plot that the support vectors are marked as crosses and the rest of the data as circles. 
    The misclassified data are marked as red crosses in the blue area (if the data belongs to class 1 and was classified as class -1) or black crosses in the purple area. 
    The confusion table is given as well to show the numeric output of SVM classifier.",
    h4("What are the inputs to this app"),
    "There are four slider inputs for this graphical presentation:",
    
    h5("1. Number of data points"), "- move the slider to increase or decrease the total number of data points.",
    h5("2. Shift between the classes"), "- in this simple two-class problem the shift value represents the distance between the classes. The first class is always centered at zero while the other class will be centered around the 'shift' value that a user chooses.",
    h5("3. Training parameter C"), "- this value represents a regularization parameter in SVMS. For large values of C, the optimization will choose a smaller-margin hyperplane (it will not allow large errors), conversely, for small C you will get a large-margin and your training error might be larger.",
    h5("4. Training parameter gamma"), "- this values is a kernel parameter. Large gamma means small sigma value of a Gaussian kernel and thus it might lead to over-fitting, small gamma gives a smoother separation line, less prone to over-fitting."
  )
))
library(shiny)
library(dplyr)
library(ggplot2)
library(gapminder)

# Specify the application port
options(shiny.host = "0.0.0.0")
options(shiny.port = 8180)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      tags$h4("Gapminder Dashboard"),
      tags$hr(),
      selectInput(inputId = "inContinent", label = "Continent", choices = unique(gapminder$continent), selected = "Europe")
    ),
    mainPanel(
      plotOutput(outputId = "outChartLifeExp"),
      plotOutput(outputId = "outChartGDP")
    )
  )
)

server <- function(input, output, session) {
  # Filter data and store as reactive value
  data <- reactive({
    gapminder %>%
      filter(continent == input$inContinent) %>%
      group_by(year) %>%
      summarise(
        AvgLifeExp = round(mean(lifeExp)),
        AvgGdpPercap = round(mean(gdpPercap), digits = 2)
      )
  })
  
  # Common properties for charts
  chart_theme <- ggplot2::theme(
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
    axis.title.x = element_text(size = 15),
    axis.title.y = element_text(size = 15),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12)
  )
  
  # Render Life Exp chart
  output$outChartLifeExp <- renderPlot({
    ggplot(data(), aes(x = year, y = AvgLifeExp)) +
      geom_col(fill = "#0099f9") +
      geom_text(aes(label = AvgLifeExp), vjust = 2, size = 6, color = "#ffffff") +
      labs(title = paste("Average life expectancy in", input$inContinent)) +
      theme_classic() +
      chart_theme
  })
  
  # Render GDP chart
  output$outChartGDP <- renderPlot({
    ggplot(data(), aes(x = year, y = AvgGdpPercap)) +
      geom_line(color = "#f96000", size = 2) +
      geom_point(color = "#f96000", size = 5) +
      geom_label(
        aes(label = AvgGdpPercap),
        nudge_x = 0.25,
        nudge_y = 0.25
      ) +
      labs(title = paste("Average GDP per capita in", input$inContinent)) +
      theme_classic() +
      chart_theme
  })
}

shinyApp(ui = ui, server = server)

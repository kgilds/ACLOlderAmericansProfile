#' population_65_plus UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_population_65_plus_ui <- function(id){
  ns <- NS(id)
  #tagList(
  bs4Dash::bs4TabItem(
    tabName = "population_65_plus_ui_1",
    
  bs4Dash::bs4Card(
    title = "America's Aging Population",
    width = 12,
    maximizable = TRUE,
    status = "primary",
    p(style="padding: 10px; border: 2px solid red;", "TEXT"),
    
    
    plotly::plotlyOutput(ns("plot1"))
    
  )  
    
  
  
  )
  #)
  
}
    
#' population_65_plus Server Function
#'
#' @noRd 
mod_population_65_plus_server <- function(input, output, session){
  ns <- session$ns
  

output$plot1 <- plotly::renderPlotly({
  persongs_65_plot()
})

 
}
    
## To be copied in the UI
# mod_population_65_plus_ui("population_65_plus_ui_1")
    
## To be copied in the server
# callModule(mod_population_65_plus_server, "population_65_plus_ui_1")
 

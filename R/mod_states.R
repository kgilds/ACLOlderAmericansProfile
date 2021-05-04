#' states UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_states_ui <- function(id){
  ns <- NS(id)
  #tagList(
  bs4Dash::bs4TabItem(
    tabName = "states_ui_1",
    shiny::plotOutput(ns("state_num"))
    
    
  )  
    
  
        
      
      
    
 
  #)
}
    
#' states Server Function
#'
#' @noRd 
mod_states_server <- function(input, output, session){
  ns <- session$ns
  
output$state_num <- shiny::renderPlot({
  
  number_state_map()
   
  
})
  
 
}
    
## To be copied in the UI
# mod_states_ui("states_ui_1")
    
## To be copied in the server
# callModule(mod_states_server, "states_ui_1")
 

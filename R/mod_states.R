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
    
    fluidRow(
      bs4Dash::bs4Card(
        title = "Population 65 & older by State",
        width = 6,
        status = "purple",
        maximizable = TRUE,
        descriptionBlock(
          number =  "",
          header = "Number of Entries",
          
          number_color =  "danger",
          right_border =   TRUE,
          margin_bottom =  FALSE
        ),
        
        shiny::plotOutput(ns("state_num"))
        
      )
    )
    
    
    
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
 

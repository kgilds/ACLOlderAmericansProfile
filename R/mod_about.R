#' about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_about_ui <- function(id){
  ns <- NS(id)
  #tagList(
 bs4Dash::bs4TabItem(
   tabName = "about_ui_1",
 
   fluidRow(
     
     bs4Dash::bs4Card(
       
       width = 12,
       title= "About", 
       status = "purple", 
       maximizable = TRUE,
       overflow = TRUE,
       
       includeMarkdown("inst/about.md")
       
      
     
   )
   
   )
  
 )
  #)
}
    
#' about Server Function
#'
#' @noRd 
mod_about_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_about_ui("about_ui_1")
    
## To be copied in the server
# callModule(mod_about_server, "about_ui_1")
 

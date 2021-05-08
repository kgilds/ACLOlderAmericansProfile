#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_population_65_plus_server, "population_65_plus_ui_1")
  callModule(mod_states_server, "states_ui_1")
  callModule(mod_about_server, "about_ui_1")

}

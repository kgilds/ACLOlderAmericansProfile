#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    shiny::fluidPage(
      theme = bs_theme(version = 4, bootswatch = "pulse") %>%
      
      bs_add_variables(
        "body-bg" = "#EEEEEE",
        "font-family-base" = "Futura",
        "font-size-base" = "1.4rem",
        "btn-padding-y" = ".16rem",
        "btn-padding-x" = "2rem"
      ),
      shiny::titlePanel( "Profile of Older Americans"
        
      ),
      
      hr(),
    
      mod_population_65_plus_ui("population_65_plus_ui_1"),
      
      hr(),
      h1("State Data"),
      mod_states_ui("states_ui_1")
      
      
      )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ACLOlderAmericansProfile'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}


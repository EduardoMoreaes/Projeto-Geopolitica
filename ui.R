####    Dashboard ####
library("shiny")
library("shinyjs")
library("shinyBS")
library("shinythemes")
library("shinyWidgets")
library("ECharts2Shiny")
library("shinydashboard")
library("shinycssloaders")
library("leaflet")

temas <- c('tema1', 'tema2', 'tema3', 'tema4')
gm <- c("Guerras & Conflitos", "1ª Guerra Mundial" = 1, "2ª Guerra Mundial" = 2, "Guerra Fria" = 3)


ui <- fluidPage(
  fluidRow(
  dashboardPage(
  title = "GEOMÍDIA",
  
  # HEADER     -------------------------------------------------------
  dashboardHeader(
    title = "GEOMÍDIA",
    titleWidth = 300
  ),
  # SIDEBAR    -------------------------------------------------------               
  dashboardSidebar(
    width = 300,
    tags$div(class = "alinhamento"),
    
    sidebarMenu(
      div(id = "sidebar_button",
          div(id= 'star'),
          bsButton(inputId = "inicio", label = "", icon = icon("play-circle"), style = "danger")
      )
    ),
    br(),
    # Guerra             -----
    menuItem("GUERRAS", tabName = "antimicrobials", icon = icon("fire"),
             menuItem("1ª GUERRA MUNDIAL \n (1914-1918)",
                      actionButton(inputId = "gm1", label = "A Grande Guerra", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
                      actionButton(inputId = "imp", label = "Impérios Centrais", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
                      actionButton(inputId = "ali", label = "Aliados", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
             ),
             menuItem("2ª GUERRA MUNDIAL (1939-1945)",
                      actionButton(inputId = "gm2", label = "2ª Guerra Mundial", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
                      actionButton(inputId = "lsg", label = "Lados da 2ª Guerra", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
             ),
             menuItem("GUERRA FRIA (1945-1991)",
                      actionButton(inputId = "gf", label = "O que foi", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
                      actionButton(inputId = "otan", label = "OTAN", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
                      actionButton(inputId = "pct", label = "Pacto de Varsóvia", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
             )
    ),
    br(),
    # Organização        -----
    menuItem("ORGANIZAÇÕES", tabName = "organizacoes", icon = icon("cog", lib = "glyphicon"),
             actionButton(inputId = "onu", label = "ONU", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
             actionButton(inputId = "gst", label = "G7", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;"),
             actionButton(inputId = "gvt", label = "G20", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
    ),
    br(),
    # Sistemas Políticos ----
    menuItem("SISTEMAS POLÍTICOS", tabName = "aliancas", icon = icon("money"),
             actionButton(inputId = "sis", label = "Sistemas Políticos", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
    ),
    br(),
    
    # Referências        ----
    menuItem("REFERÊNCIAS", tabName = "referencias", icon = icon("book"),
             actionButton(inputId = "ref", label = "Referências utilizadas", style="width:90%; height: 44px; background-color:black; background-image: linear-gradient(to right, transparent, darkgreen,green, darkgreen, transparent); color: wheat; font-size: 20px; font-family: cursive; margin-left:-15px; margin-top:8px; border-color: transparent; text-align: center;")
    ),
    br()
  ),
  # BODY       -------------------------------------------------------
  dashboardBody(
    tags$head(
      tags$link(
        rel = "stylesheet", 
        type = "text/css", 
        href = "style.css")
    ),
    
    useShinyjs(),
    
    loadEChartsLibrary(),
    loadEChartsTheme('vintage'),
    loadEChartsTheme('roma'),
    loadEChartsTheme('macarons'),
    loadEChartsTheme('jazz'),
    
    fluidRow(
      leafletOutput(outputId = "mapa")
    ),
    
    
    fluidRow(
      column(5,
             textOutput(outputId = "GraficoPie"),
             tags$div(id="graph_pie", style="width:100%;height:300px;"),  # Specify the div for the chart.
             deliverChart(div_id = "graph_pie"),
      ),
      column(7,
             # Deliver the plotting
             
             textOutput(outputId = "GraficoBar"),
             tags$div(id="graph_bar", style="width:100%;height:300px;"),
             deliverChart(div_id = "graph_bar")
      )
    ),
    
    fluidRow(
      column(1),
      column(10,
             textOutput(outputId = "GraficoLin"),
             tags$div(id="graph_line", style="width:100%;height:300px;"),
             deliverChart(div_id = "graph_line")
      )
    ),
    
    fluidRow(
      htmlOutput(outputId = "texto")
    ),
  )
)
),
fluidRow(
  id = "rodape",
  tags$div(class = "rodape",
           style = "display: inline-block; margin-left: 20%; margin-top: 10px",
           tags$p("Trabalho de Conclusão de Curso"),
           tags$p("Dev: Eduardo Moraes"),
           tags$p("Colaboradores: Rodrigo Silva & Tauê Alam")),
  tags$div(class = "rodape",
           style = "display: inline-block; margin-left: 10%; text-align: center;",
           tags$a("YouTube", href = "https://www.youtube.com/channel/UCfNmrvIOuXkVB-FaycLmlEQ"),
           tags$b("|"),
           tags$a("Instagram", href = "https://www.instagram.com/eduardo_._moraes/"),
           br(),
           tags$a("GitHub", href = "https://github.com/EduardoMoreaes/geomidia"),
           tags$b("|"),
           tags$a("Linkedin", href = "https://www.linkedin.com/in/eduardo-lopes-de-moraes-a572541bb/"),
           tags$b("|"),
           tags$a("Portifólio", href = "https://eduardomoreaes.github.io/sobre-mim/")),
  tags$div(class = "rodape",
           style = "display: inline-block; margin-left: 10%; ",
           tags$p("Contato:"),
           tags$p("lmoraeseduardo@gmail.com"))
)
)

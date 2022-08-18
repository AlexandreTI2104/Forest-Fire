from mesa.visualization.modules import CanvasGrid, ChartModule, PieChartModule
from mesa.visualization.ModularVisualization import ModularServer
from mesa.visualization.UserParam import UserSettableParameter

from .model import ForestFire

COLORS = {"Fine": "#00AA00", "On Fire": "#880000", "Burned Out": "#000000"}

# Copyright Alexandre Victor Curcino 23/07/2022 
def forest_fire_portrayal(tree):
    if tree is None:
        return
    portrayal = {"Shape": "rect", "w": 1, "h": 1, "Filled": "true", "Layer": 0}
    (x, y) = tree.pos
    portrayal["x"] = x
    portrayal["y"] = y
    portrayal["Color"] = COLORS[tree.condition]
    return portrayal


canvas_element = CanvasGrid(
    forest_fire_portrayal, 100, 100, 500, 500
)
tree_chart = ChartModule(
    [{"Label": label, "Color": color} for (label, color) in COLORS.items()]
)
pie_chart = PieChartModule(
    [{"Label": label, "Color": color} for (label, color) in COLORS.items()]
)

velocidade_do_alastramento_fogo_chart = ChartModule(
    [{"Label": "Velocidade do Alastramento do Fogo", "Color": "#FF0000"}]
)

model_params = {
    "height": UserSettableParameter("slider","Largura da Floresta", 100, 5, 100, 5),
    "width": UserSettableParameter("slider","Profundidade da Floresta", 100, 5, 100, 5),
    "density": UserSettableParameter("slider","Densidade das Árvores", 0.65, 0.01, 1.0, 0.01),
    
}
server = ModularServer(
    ForestFire, [canvas_element, tree_chart, pie_chart, velocidade_do_alastramento_fogo_chart], "Forest Fire", model_params
)
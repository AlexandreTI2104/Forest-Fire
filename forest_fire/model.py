import statistics
from mesa import Model
from mesa.datacollection import DataCollector
from mesa.time import RandomActivation
from mesa.space import Grid
from .agent import TreeCell
import mesa


class ForestFire(Model):
    """
    Simple Forest Fire model.
    """

    last_alastramento_fogo = 0
    # Variável Independente: Largura da Floresta e Profundidade da Floresta.
    def __init__(self, width=100, height=100, density=0.65, largura_floresta = 100, profundidade_floresta = 100):
        """
        Create a new forest fire model.
        Args:
            width, height: The size of the grid to model
            density: What fraction of grid cells have a tree in them.
        """
        # Set up model objects
        # Variável Dependente: Fine, On Fire, Burned Out e Velocidade do Alastramento do Fogo.
        self.schedule = RandomActivation(self)
        self.densidade = density
        self.largura_floresta = largura_floresta
        self.profundidade_floresta = profundidade_floresta
        self.grid = mesa.space.MultiGrid(width, height, True)

        self.datacollector = DataCollector(
            {
                "Fine": lambda m: self.count_type(m, "Fine"),
                "On Fire": lambda m: self.count_type(m, "On Fire"),
                "Burned Out": lambda m: self.count_type(m, "Burned Out"),
                "Velocidade do Alastramento do Fogo": lambda m: self.max_alastramento(m),
                "Largura da Floresta": lambda m: largura_floresta,
                "Profundidade da Floresta": lambda m: profundidade_floresta
            }
        )

        # Place a tree in each cell with Prob = density
        for (contents, x, y) in self.grid.coord_iter():
            if self.random.random() < density:
                # Create a tree
                new_tree = TreeCell((x, y), self)
                # Set all trees in the first column on fire.
                if x == 0:
                    new_tree.condition = "On Fire"
                self.grid.place_agent(new_tree, (x, y))
                self.schedule.add(new_tree)

        self.running = True
        self.datacollector.collect(self)

    def step(self):
        """
        Advance the model by one step.
        """
        self.schedule.step()
        # collect data
        self.datacollector.collect(self)

        # Halt if no more fire
        if self.count_type(self, "On Fire") == 0:
            self.running = False

    @staticmethod
    def count_type(model, tree_condition):
        """
        Helper method to count trees in a given condition in a given model.
        """
        count = 0
        for tree in model.schedule.agents:
            if tree.condition == tree_condition:
                count += 1
        return count
    
    @staticmethod
    def max_alastramento(model):
        # Calcula o espaço percorrido e diminui pelo número de passos a respeito do alastramento do fogo anterior.
        alastramento_fogo = [tree for tree in model.schedule.agents if tree.condition == 'Burned Out']
        alastramento_fogo = len(alastramento_fogo)
        alastramento_fogo -= model.last_alastramento_fogo
        model.last_alastramento_fogo += alastramento_fogo

        return alastramento_fogo
from forest_fire.model import ForestFire
from mesa import batch_run
import pandas as pd
import numpy as np
from datetime import datetime

# Início do Design do Experimento.
params = {"width": 20, "height": 20, "density": 150}

# Define a quantidade de experimentos que serão repetidos para cada configuração de valores para as variáveis independentes e de controle. 
experiments_per_parameter_configuration = 100

# Define a quantidade de passos suficientes para que a simulação alcance um estado de equilíbrio.
max_steps_per_simulation = 100


# Executa as simulações.
results = batch_run(
    ForestFire,
    parameters = params,
    iterations = experiments_per_parameter_configuration,
    max_steps = max_steps_per_simulation,
    number_processes = 1,
    data_collection_period = -1,
    display_progress = True,
)

# Converte para uma planilha.
results_df = pd.DataFrame(results)
now = str(datetime.now()).replace(":", "-").replace(" ", "-")

file_name_suffix = ("_iter_" + str(experiments_per_parameter_configuration) + "_steps_" + str(max_steps_per_simulation) + "_" + now)

results_df.to_csv("Forest-Fire" + file_name_suffix + ".csv")
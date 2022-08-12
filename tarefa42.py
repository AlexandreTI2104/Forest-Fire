from forest_fire.model import ForestFire
from mesa import batch_run
import pandas as pd
import numpy as np
from datetime import datetime

# Início do Design do Experimento.

params = {"N": 100, "width": 10, "height": 10, "D": np.arange(0, 1, 0.2)}

experiments_per_parameter_configuration = 100
max_steps_per_simulation = 300

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

results_df.to_csv("Forest_fire_model_data" + file_name_suffix + ".csv")
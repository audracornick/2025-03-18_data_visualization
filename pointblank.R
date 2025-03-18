library(pointblank)

small_table 

small_table |> 
  col_vals_lt(a, value = 10)
# returns a dataframe if successful, else it returns a failure message

# perform multiple checks at once
small_table |>
  col_vals_lt(a, value = 10) |>
  col_vals_between(d, left = 0, right = 5000) |>
  col_vals_in_set(f, set = c("low", "mid", "high")) |>
  col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$")

small_table |>
  col_vals_lt(a, value = 10) |>
  col_vals_between(d, left = 0, right = 10000) |>
  col_vals_in_set(f, set = c("low", "mid", "high")) |>
  col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$")

agent <- small_table |> 
  create_agent() |> 
  col_vals_lt(a, value = 10) |>
  col_vals_between(d, left = 0, right = 5000) |>
  col_vals_in_set(f, set = c("low", "mid", "high")) |>
  col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$")
agent 

agent |> 
  interrogate()

agent <- agent |> 
  interrogate()

get_sundered_data(agent, type = "pass")
# returns only the rows that passed

get_sundered_data(agent, type = "fail")
# returns all of the rows where something has failed

get_sundered_data(agent, type = "combined")
# returns a combined column that tells you if they passed or failed (.pd_combined)

get_data_extracts(agent)
# returns a pass/failed list of data



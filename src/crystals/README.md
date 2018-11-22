# Cluster: src/crystals

This is the main crystal folder. To install a crystal properly, drag the file to the `main` folder within this one.

To generate a new crystal, run `ruby generate.rb <CrystalName>` (the file has a shebang, so you can make it executable and run `./generate.rb <CrystalName>` as well). The crystal name must have no spaces and be in CamelCase to work with the script! The script automatically names the file the snake_cased version of your crystal name, as is required by the main script. The generated crystal is found in the `dev` folder, and can be run through `ruby run.rb -d` in the root directory, or `ruby run.rb -a` to run alongside your main modules.
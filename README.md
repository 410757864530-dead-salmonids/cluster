# Cluster: A Clunky Modular Bot Framework for Discordrb

Cluster is a modular bot framework I made for [discordrb](https://github.com/meew0/discordrb),
partially inspired by [gemstone](https://github.com/z64/gemstone).

I really only made it for two reasons:

* To get my own personal bot projects more organized
* To function as a superweapon for the Diamond Authority after the failed colonization

All individual modules, called crystals, are located in the `src` directory. The `main` folder contains all the crystals
that are loaded by default, and the `dev` folder contains crystals that will be loaded either by themselves or alongside
the main crystals as desired.

## Instructions

To begin, clone this repository to your local machine, then run `rake remove_git` to delete the repository files.

To run a bot, fill in `config.yml` with all the necessary information and then execute `rake` on the command line.
It will automatically load all crystals present in the `src/main` directory. To run crystals present i
the `src/dev` directory, execute `rake run[dev]` for dev crystals exclusively and `rake run[all]` to run both
main and dev crystals.

## Installing a crystal

Simply drag the `crystal_name.rb` file into the `src/main` directory and run the bot as normal.
If a data folder is also included, drag the contents of it to the `data` folder;
do the same for `lib` if it is included as well.

## Developing a crystal

For development of crystals, a simple crystal template is included in `src`. Simply run `rake generate[CrystalName]`,
replacing `CrystalName` with the name of your crystal in CamelCase, and a starter crystal will be generated.

### Additional files

If a crystal you are developing needs additional files to be loaded, they should be placed in the `lib` directory;
all files in this directory are loaded prior to loading all crystals.
# SorceryTcgData

🤝 If you're also maintaining sorcery data, let's get in touch as I'd be very interested in consolidating to a single source of truth.

---

**The data presented in this repository about Sorcery: Contested Realm, both literal and graphical, is copyrighted by Erik's Curiosa Limited. This project is not produced, endorsed, supported, or affiliated with Erik's Curiosa Limited.**

This repository houses serialized card and game data for the trading card game [Sorcery: Contested Realm](https://www.sorcerytcg.com).

### `data`

The core of this project is the YAML data contained in the `data` directory.
If you see a mistake or have metadata you would like to add, feel free to open up a pull request.

YAML is used as it's much easier to write, and currenty I suspect these files will be edited by hand until better tooling is supported.
If you'd prefer JSON, you can use `yq -out=json path/to/file.yaml` and be on your way.

### `src`

The data directory aims to be platform agnostic.
The src directory houses platform specific packages that wrap the data.
We'll see if this turns out to be a bad idea :sweat_smile:
If so, the packages will be moved to their own repositories.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/realmsapp/sorcery_tcg_data. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/realmsapp/sorcery_tcg_data/blob/main/CODE_OF_CONDUCT.md).

### Translations

If you'd like to add support for a new locale, copy the `data/en` directory and build out similar translated YAML files.

TODO: Process for validating these files. Perhaps jsonschema or (arguably simpler) jsontypedef?

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in this codebase, issue tracker, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/realms_app/sorcery_tcg_data/blob/main/CODE_OF_CONDUCT.md).

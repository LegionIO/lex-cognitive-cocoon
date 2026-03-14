# lex-cognitive-cocoon

**Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Protective encapsulation of fragile ideas during development. Models cognitive cocooning: fragile ideas enter protective shells, gestate at complexity-appropriate rates, and emerge transformed. Premature exposure risks idea death (premature penalty). Distinct from `lex-cognitive-chrysalis` — cocoon focuses on the protective encapsulation container, while chrysalis models the full metamorphic transformation lifecycle.

## Gem Info

- **Gem name**: `lex-cognitive-cocoon`
- **Version**: `0.1.0`
- **Module**: `Legion::Extensions::CognitiveCocoon`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_cocoon/
  cognitive_cocoon.rb
  version.rb
  client.rb
  helpers/
    constants.rb
    cocoon.rb
    incubator.rb
  runners/
    cognitive_cocoon.rb
```

## Key Constants

From `helpers/constants.rb`:

- `GESTATION_STAGES` — `%i[encapsulating developing transforming ready emerged]`
- `COCOON_TYPES` — `%i[silk chrysalis shell pod web]`
- `PROTECTION_BY_TYPE` — `silk: 0.6, chrysalis: 0.8, shell: 0.9, pod: 0.7, web: 0.5`
- `MAX_COCOONS` = `100`
- `MATURITY_RATE` = `0.1`, `PREMATURE_PENALTY` = `0.5`
- `MATURITY_LABELS` — `0.9+` = `:fully_gestated`, `0.7` = `:nearly_ready`, `0.5` = `:mid_gestation`, `0.3` = `:early_gestation`, `0.1` = `:just_encapsulated`, below = `:newly_formed`

## Runners

All methods in `Runners::CognitiveCocoon`:

- `create_cocoon(cocoon_type:, domain:, content: '', maturity: nil, protection: nil)` — creates a new cocoon; protection defaults to `PROTECTION_BY_TYPE[cocoon_type]`
- `gestate_all(rate: MATURITY_RATE)` — advances maturity on all non-emerged cocoons by rate
- `harvest_ready` — returns all cocoons that have reached `:ready` or `:emerged` state
- `force_emerge(id:)` — forces premature emergence; applies `PREMATURE_PENALTY`
- `cocoon_status` — aggregate incubator report
- `list_by_stage(stage:)` — filters cocoons by gestation stage

## Helpers

- `Incubator` — manages the cocoon collection. `harvest_ready` transitions ready cocoons to `:emerged` and returns them.
- `Cocoon` — has `cocoon_type`, `domain`, `content`, `maturity`, `protection`. `gestate!(rate)` advances maturity; stage is derived from maturity value. `force_emerge!` applies premature penalty and sets stage to `:emerged`.

## Integration Points

- `lex-cognitive-chrysalis` composes with this extension: a chrysalis can be enclosed in a cocoon (the cocoon provides protection, the chrysalis undergoes transformation inside it).
- Newly registered `lex-memory` traces during the imprint window (`lex-coldstart`) are conceptually in a cocooned state — fragile associations that should not be immediately overwritten or decayed.
- `gestate_all` is the natural periodic runner to call each tick cycle.

## Development Notes

- `@default_engine` is referenced directly in runner methods (not via a private method helper) — this differs from other extensions. The runner accesses `@default_engine` directly; callers must pass `engine:` to avoid sharing state across runner instances.
- `protection` defaults to `PROTECTION_BY_TYPE[cocoon_type]` if not specified — callers who want to set a custom protection must pass it explicitly.
- `PREMATURE_PENALTY = 0.5` reduces maturity on forced emergence, not a separate beauty score.
- `MAX_COCOONS = 100` — at capacity, new cocoon creation raises an error.

# lex-cognitive-cocoon

Protective encapsulation of fragile ideas during development for LegionIO agents. Models cognitive cocooning — fragile ideas enter protective shells, gestate at complexity-appropriate rates, and emerge transformed.

## What It Does

Not all ideas are ready for the world. Some need protected incubation before they are robust enough to integrate with existing knowledge. This extension models that protective phase: ideas are wrapped in type-appropriate cocoons (silk, chrysalis, shell, pod, web) with different protection strengths, and gestate through stages until they are ready to emerge. Premature forced emergence applies a maturity penalty.

## Usage

```ruby
client = Legion::Extensions::CognitiveCocoon::Client.new

cocoon = client.create_cocoon(
  cocoon_type: :shell,
  domain: :identity,
  content: 'tentative belief about autonomy thresholds'
)

# Call periodically to advance gestation
5.times { client.gestate_all(rate: 0.1) }

client.cocoon_status
# => { total: 1, ready: 0, emerged: 0, ... }

ready = client.harvest_ready
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT

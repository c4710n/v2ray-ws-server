# v2ray-ws-server

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

```console
Usage: v2ray-ws-server [OPTIONS] <UUID file>
Run a WebSocket server of V2ray.

Options:
  -h, --help                      Print usage
  -l, --listen-address <address>  Specify the address to listen (default: 0.0.0.0)
  -p, --listen-port <port>        Specify the port to listen (default: 7000)
  --ws-path <path>                Specify the path of WebSocket (default: /v2ray)
  --log-level                     Specify the log level (default: info)
  --debug                         Debug the interval variables and built config

<UUID file> is a plain file containing UUIDs separated by newlines. Comments are empty
lines are supported, too. Following is the example content of <UUID file>:

    # spike
    83c11ba2-09a8-5335-2aa0-15c58d0e30dc

    # vicious
    395188d5-dbbb-3ce7-e7dc-c887562616fc

    # julia
    0aaae132-5fec-24c2-873b-688dfbbf94d0

    # ...

This project is designed to work in conjunction with NixOS in order to avoid exposing
sensitive information to the Nix store.
```

## License

MIT

# iCSP

An interactive CryptoPro CSP shell that tries to imitate its GUI counterpart on the Windows platform. 
Built for macOS and Linux daily use by wrapping a set of CryptoPro CLI tools: cryptcp, certmgr, csptest, cpconfig, etc.

The project goal is only to simplify my daily life with CryptoPro CSP on *nix systems.
Not everything is polished. Feel free to submit a PR if you need to add extra commands/options or fix bugs.

See:
* https://www.cryptopro.ru/products/other/cryptcp
* https://www.cryptopro.ru/sites/default/files/products/cryptcp/cryptcp_5.0.x.pdf
* https://www.cryptopro.ru/sites/default/files/docs/certmgr.pdf

## Usage

Management commands:

* certificate — Manage certificates
* container — Manage containers
* hardware — Manage hardware
* license — Manage licenses

CSP commands:

* create_signature
* verify_signature
* create_hash
* verify_hash
* encrypt_file
* decrypt_file


## Examples

List all key containers

```bash
./bin/icsp container list
```

Create a signature for the file

```bash
./bin/icsp create_signature document.txt
```

## License

[MIT](./LICENSE)
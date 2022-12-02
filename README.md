# iCSP

An interactive CryptoPro CSP shell that tries to imitate its GUI counterpart on the Windows platform. 
Built for macOS and Linux daily use by wrapping a set of CryptoPro CLI tools: cryptcp, certmgr, csptest, cpconfig, etc.

The project goal is only to simplify my daily life with CryptoPro CSP on *nix systems.
Not everything is polished. Feel free to submit a PR if you need to add extra commands/options or fix bugs.

See:
* https://www.cryptopro.ru/products/other/cryptcp
* https://www.cryptopro.ru/sites/default/files/products/cryptcp/cryptcp_5.0.x.pdf
* https://www.cryptopro.ru/sites/default/files/docs/certmgr.pdf

## Installation

Execute

    gem install icsp

## Usage

Management commands:

* certificate — Manage certificates
  * list
  * view
  * install
  * delete

* container — Manage containers
  * list
  * check
  
* hardware — Manage hardware
  * list — Review of the installed readers, generators of random numbers and media
  
* license — Manage licenses
  * view — View license
  * set — Set license

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
icsp container list
```

Create a signature for the file

```bash
icsp create_signature document.txt
```

## Configuration

ICSP is configured by ENV variables

* `CSP_PATH` allows to override default CryptoPro CSP path. Default is `/opt/cprocsp`.
* `LOG_LEVEL` to debug your operations. Default is `warn`. 

## License

[MIT](./LICENSE)
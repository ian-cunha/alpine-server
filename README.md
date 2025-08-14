# 🐧 Alpine Server – Ambiente Ubuntu-like em Alpine

Este projeto cria uma imagem **Alpine Linux** otimizada para se comportar de forma semelhante a um **Ubuntu Server** minimalista, mas mantendo a leveza e velocidade do Alpine.

Inclui ferramentas comuns para administração de sistemas, desenvolvimento, rede e segurança, além de um **bash colorido com autocomplete** para facilitar o uso.

---

## 📦 Pacotes incluídos

- **Shell & Utilitários GNU**
  - `bash`, `bash-completion`, `coreutils`, `findutils`, `gawk`, `grep`, `sed`, `less`, `util-linux`, `procps`, `tzdata`, `file`
- **Rede**
  - `curl`, `wget`, `iproute2`, `iputils`, `net-tools`, `bind-tools`, `busybox-extras`, `openssh`, `rsync`, `socat`
- **Segurança**
  - `openssl`, `ca-certificates`, `sudo`, `shadow`
- **Edição & Arquivos**
  - `nano`, `unzip`, `zip`
- **Ferramentas de Build**
  - `build-base`, `make`, `cmake`, `pkgconfig`
- **Linguagens**
  - `python3`, `py3-pip`, `perl`
- **Controle de versão**
  - `git`, `subversion`, `mercurial`
- **Outros**
  - `docker-cli`

---

## 🎨 Bash Colorido

A imagem vem com:

- **Prompt colorido** no formato `usuário@host:/diretório`
- **Aliases úteis**:  
  - `ls` e `ll` com cores
  - `grep` com destaque
- **Autocomplete** habilitado

---

## 🚀 Como usar

1. **Baixar a imagem do Docker Hub**
```bash
docker pull inatus/alpine-server:latest
```

2. **Rodar o container**
```bash
docker run -it SEU_USUARIO/alpine-server:latest
```

---

## 📄 Licença

Este projeto está sob a licença MIT. Sinta-se livre para usar e modificar.

#!/bin/bash

# Verifica se há mudanças pendentes
if git diff --exit-code && git diff --cached --exit-code; then
  echo "No changes to commit."
  exit 0
fi

# Função para obter o scope com base no caminho do arquivo
get_scope() {
  file="$1"
  # Extraindo a primeira parte do caminho como escopo (ex: scripts/file.gml => scripts)
  scope=$(echo "$file" | cut -d'/' -f1)
  echo "$scope"
}

# Função para adicionar, commitar e exibir mensagem apropriada com scope
commit_file() {
  file="$1"
  change_type="$2"

  # Obtendo o scope do arquivo
  scope=$(get_scope "$file")

  # Gerando mensagem baseada no tipo de mudança e scope
  case $change_type in
    "modified")
      msg="fix(${scope}): modified $file"
      ;;
    "deleted")
      msg="chore(${scope}): removed $file"
      ;;
    "new")
      msg="feat(${scope}): added new file $file"
      ;;
  esac

  git add "$file"
  git commit -m "$msg"
  echo "File '$file' committed with message: '$msg'"
}

# Verifica especificamente se 'Space Shooter.yyp' foi alterado
if git status --porcelain | grep -q ' M .*Space Shooter\.yyp'; then
  git add "Space Shooter.yyp"
  git commit -m "fix(project): modified Space Shooter.yyp"
  echo "File 'Space Shooter.yyp' committed successfully."
fi

# Processa arquivos modificados e deletados (exceto Space Shooter.yyp)
while IFS= read -r file; do
  if [[ "$file" != "Space Shooter.yyp" ]]; then
    if [[ -f "$file" ]]; then
      commit_file "$file" "modified"
    else
      git rm "$file"
      git commit -m "chore($(get_scope "$file")): removed $file"
      echo "File '$file' has been removed and committed."
    fi
  fi
done < <(git status --porcelain | grep -E '^( M| D)' | awk '{print substr($0,4)}')

# Processa arquivos não rastreados (novos)
while IFS= read -r file; do
  commit_file "$file" "new"
done < <(git status --porcelain | grep '^??' | awk '{print substr($0,4)}')

# Faz push para a branch principal
echo "Pushing to the main branch..."
git push origin main

echo "Process completed successfully!"

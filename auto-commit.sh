#!/bin/bash

# Verifica se há mudanças pendentes
if git diff --exit-code && git diff --cached --exit-code; then
  echo "No changes to commit."
  exit 0
fi

# Função para adicionar, commitar e exibir mensagem apropriada
commit_file() {
  file=$1
  change_type=$2

  case $change_type in
    "modified")
      msg="fix: modified $file"
      ;;
    "deleted")
      msg="chore: removed $file"
      ;;
    "new")
      msg="feat: added new file $file"
      ;;
  esac

  git add "$file"
  git commit -m "$msg"
  echo "File '$file' committed with message: '$msg'"
}

# Processa arquivos modificados e deletados
for file in $(git status --porcelain | grep -E '^( M| D)' | awk '{print $2}'); do
  if [[ -f $file ]]; then
    commit_file "$file" "modified"
  else
    git rm "$file"
    git commit -m "chore: removed $file"
    echo "File '$file' has been removed and committed."
  fi
done

# Processa arquivos não rastreados (novos)
for file in $(git status --porcelain | grep '^??' | awk '{print $2}'); do
  commit_file "$file" "new"
done

# Faz push para a branch principal
echo "Pushing to the main branch..."
git push origin main

echo "Process completed successfully!"


#!/bin/bash

data_file="passwords_step2.txt"

while true; do
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
  read choice

  if [ "$choice" = "Add Password" ]; then
    echo "サービス名を入力してください："
    read service_name
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    echo "$service_name:$username:$password" >> $data_file
    echo "パスワードの追加は成功しました。"

  elif [ "$choice" = "Get Password" ]; then
    echo "サービス名を入力してください："
    read service_name

    result=$(grep "$service_name" $data_file)
    if [ -z "$result" ]; then
      echo "そのサービスは登録されていません。"
    else
      echo "サービス名：$service_name"
      echo "ユーザー名：$username"
      echo "パスワード：$password"
    fi

  elif [ "$choice" = "Exit" ]; then
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
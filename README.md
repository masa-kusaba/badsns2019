# Bad SNS 2019

This is a significant vulnerable SNS web application made with Ruby on Rails.

The product is meant for educational purposes only.  
DO NOT use any portion of the code for production.

某SNS風の脆弱なWebアプリケーション。

Ruby on Railsで開発されています。  
意図的に脆弱性を作り込りこんであり、やられアプリなどの用途で利用が可能です。  

このアプリは教育目的での利用のみを意図して作られています。  
非常に危険なので製品の一部としてコードを流用しないでください。

## Pull

```
$ docker pull ommadawn46/badsns2019
```

## Run

```
$ docker run --privileged -d --rm -p 10080:80 --name badsns2019 ommadawn46/badsns2019
```

## SNS

http://localhost:10080/

## MailHog

http://localhost:10080/mailhog/

## License

Please see [LICENSE](https://github.com/ommadawn46/badsns2019/blob/master/LICENSE).

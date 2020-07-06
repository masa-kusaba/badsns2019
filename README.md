# Bad SNS 2019

Bad SNS 2019 is a vulnerable web app built on Ruby on Rails.

Bad SNS 2019は、某SNSを模して作られた脆弱性を多数含むWebアプリケーションです。

セキュアコーディングや脆弱性診断のトレーニング教材（やられアプリ）として利用が可能です。
 
本アプリケーションは、Ruby on Railsで開発されています。


## 注意

The product is meant for educational purposes only.  
DO NOT use any portion of the code for production.

Bad SNS 2019は、教育目的での利用のみを意図して作られています。  
危険なので、製品の一部としてコードを流用しないでください。


## Quick Start

### Run

```
$ docker run --privileged -d --rm -p 10080:80 --name badsns2019 ommadawn46/badsns2019
```

### Browse

- Bad SNS: http://localhost:10080/

- MailHog: http://localhost:10080/mailhog/


## License

Please see [LICENSE](https://github.com/ommadawn46/badsns2019/blob/master/LICENSE).

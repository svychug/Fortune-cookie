import 'package:get/get.dart';

class LocaleString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    //ENGLISH LANGUAGE
    'en_US':{
      'change_lang':'Change Language',
      'signup':'SIGN UP',
      'login':'LOGIN',
      'first_name':'FIRST NAME',
      'last_name':'LAST NAME',
      'email':'EMAIL',
      'password':'PASSWORD',
      'forgot_pass':'Forgot password?',
      'choose_your_lang':'Choose Your Language',
      'fortune':'Fortune',
      'cookie':'Cookie'
    },
    //RUSSIAN LANGUAGE
    'ru_RU':{
      'change_lang':'Сменить язык',
      'signup':'Регистрация',
      'login':'Авторизация',
      'first_name':'ИМЯ',
      'last_name':'ФАМИЛИЯ',
      'email':'ПОЧТА',
      'password':'ПАРОЛЬ',
      'forgot_pass':'Забыли пароль?',
      'choose_your_lang':'Выберите Ваш язык',
      'fortune':'Печенье',
      'cookie':'Удачи'
    },
  };

}
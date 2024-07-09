class Constants {
  static const getStartedLottiePath = 'assets/GetStarted.json';
  static const getStartedSvg = 'assets/getStarted2.svg';

  static const String kUserSignUpUrl = 'http://192.168.0.104:8000/user/signup';

  static const String kUserAvatarPath = 'assets/avatar/userAvatar.png';

  static const recipePreferences = {
    'veg': {
      'label': 'Vegetarian',
      'value': 'veg',
    },
    'nonVeg': {
      'label': 'Non Vegetarian',
      'value': 'nonVeg',
    },
    'dairyFree': {
      'label': 'Dairy-Free',
      'value': 'dairyFree',
    },
    'vegan': {
      'label': 'Vegan',
      'value': 'vegan',
    },
    'indian': {
      'label': 'Indian',
      'value': 'indian',
    },
    'chinese': {
      'label': 'Chinese',
      'value': 'chinese',
    },
    'italian': {
      'label': 'Italian',
      'value': 'italian',
    },
    'mexican': {
      'label': 'Mexican',
      'value': 'mexican',
    },
    'deserts': {
      'label': 'Deserts',
      'value': 'deserts',
    },
    'snacks': {
      'label': 'Snacks',
      'value': 'snacks',
    },
    'mainCourse': {
      'label': 'Main Course',
      'value': 'mainCourse',
    },
  };
}

enum KTimeOfDay { morning, afternoon, evening }

Map<KTimeOfDay, dynamic> kGreetings = {
  KTimeOfDay.morning: {
    'Good Morning': [
      'What delicious dish will you create today?',
      'Let\'s get your kitchen adventures started. What are you craving for breakfast?',
      'Coffee brewing, sunshine streaming. ☕ The perfect time to browse for a mouthwatering recipe!',
    ]
  },
  KTimeOfDay.afternoon: {
    'Good Afternoon': [
      'It\'s lunchtime! What tasty creation will satisfy your midday cravings?',
      'Let\'s beat the afternoon slump with a delicious recipe!',
      'Halfway through your day? Take a break and explore some inspiring recipes for your next meal!',
    ]
  },
  KTimeOfDay.evening: {
    'Good Evening': [
      'Dinnertime is calling. Explore our recipes to create a perfect meal!',
      'Let\'s unwind after a long day with a delicious recipe! ‍♀️ What will be on your dinner plate tonight?',
      'The kitchen is yours! Whip up a culinary masterpiece with one of our inspiring recipes!',
    ]
  }
};

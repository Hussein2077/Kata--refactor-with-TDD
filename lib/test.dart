class UserPointsManager {
  int calculatePoints(
      {required UserType userType,
      required int purchases,
      required int reviews,
      required int referrals,
      int? yearsActive}) {
    int totalPoints = 0;

    int calculateRegularPoints(int purchases, int reviews, int referrals) =>
        purchases * 2 + reviews * 1 + referrals * 5;
    int calculatePremiumPoints( int purchases, int reviews, int referrals, int yearsActive) =>
        purchases * 3 + reviews * 2 + referrals * 10 + yearsActive * 20;
    int calculateBonusPoints(int purchases, int reviews, int referrals) {
      int bonusPoints = 0;
      if (purchases > 100) bonusPoints += 100;

      if (reviews > 200) bonusPoints += 50;

      if (referrals > 50) bonusPoints += 200;

      return bonusPoints;
    }

    switch (userType) {
      case  UserType.admin:
        totalPoints = 9999;
        break;
      case UserType.premium:
        totalPoints = calculatePremiumPoints(
            purchases, reviews, referrals, yearsActive ?? 0);
        break;
      default:
        totalPoints += calculateRegularPoints(purchases, reviews, referrals);
        break;
    }

    totalPoints += calculateBonusPoints(purchases, reviews, referrals);

    return totalPoints;
  }

}
enum UserType { regular, premium, admin }

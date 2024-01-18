class RecipeModel {
  String name;
  String iconPath;
  String description;
  String? about;
  List<String>? ingredients;
  List<String>? instructions;

  RecipeModel({
    required this.name,
    required this.iconPath,
    required this.description,
    required this.about,
    required this.ingredients,
    required this.instructions,
  });

  static List<RecipeModel> getRecipes() {
    List<RecipeModel> recipes = [];

    recipes.add(RecipeModel(
      name: 'Phở bò',
      iconPath: 'assets/icons/1.jpg',
      description: 'Traditional Vietnamese beef noodle soup.',
      about:
          "Phở bò (Vietnamese beef noodle soup) could easily be called Vietnam's national dish. Most often served in the early morning, it is available on any street corner, everywhere in Vietnam, all day, and is a staple of most Vietnamese restaurants outside of the country. The broth is the star of this meal and can vary from North to South and is in some cases a closely guarded family secret. Experimenting with the ingredients is a must as long as they are traditionally South-East Asian in origin.",
      ingredients: [
        'Broth:',
        '2 large white onions, cut into quarters',
        '1 tablespoon vegetable or peanut oil',
        '5 lbs beef bones (choose ones with a bit of meat on them)',
        '1 small knob of ginger, chopped',
        '1 small cinnamon stick',
        '2 whole cardamom pods',
        '4 whole cloves',
        '1 star anise pod',
        '1 tablespoon whole black peppercorns',
        'Serving:',
        'Phở noodles (thin, flat rice noodles), soaked in hot water until soft and drained',
        'Finely sliced white onion',
        'Finely sliced scallions',
        'Chopped coriander leaf',
        'Finely sliced beef sirloin',
        'Condiments:',
        'Whole chili peppers',
        'Bean sprouts',
        'Limes, cut into wedges',
        'Thai basil',
        'Nước mắm',
        'Hot sauce',
        'Hoisin sauce',
        'Black pepper',
      ],
      instructions: [
        "Fry onions in oil until lightly browned. Remove and drain.",
        "Rinse the beef bones, place in a stockpot, cover with cold water, and bring slowly to a boil. Reduce heat and simmer, uncovered, for 10–15 minutes. For a clear broth skim off foam.",
        "After this initial cooking, add cooked onions, ginger, cinnamon, cardamom, star anise, cloves, garlic and peppercorns. Bring to a boil again and gently simmer the stock, partially covered, for a minimum of 6 hours but up to 12 hours if you can, skimming regularly. If necessary, add more water to keep the bones covered.",
        "Strain stock to remove the vegetable and spices and discard them. Return the broth to the stove to keep it boiling hot.",
        "In a large soup bowl, place a handful of cooked phở noodles, top with thinly sliced raw beef, and ladle on generous amounts of very hot broth, which will cook the raw beef. Garnish with sliced onions, scallions and coriander, and serve immediately.",
      ],
    ));

    recipes.add(RecipeModel(
      name: 'Phở Gà',
      iconPath: 'assets/icons/2.jpg',
      description: 'Traditional Vietnamese chicken noodle soup.',
      about:
          "Phở Gà is a Vietnamese chicken noodle soup dish. It is considered one of the culinary gems of Vietnamese cuisine, available within a mile radius of almost every person in the community of Little Saigon, a Vietnamese enclave located in Orange County, California. Although the flavors are complex, the technique is simple, and the result is delectable.",
      ingredients: [
        'Seasoning Pouch:',
        '1 tsp fennel seed',
        '1 tsp peppercorns',
        '3 whole star anise',
        '1–2 dried cardamom pods',
        '1/2 stick cinnamon',
        '3 whole cloves',
        'Soup:',
        '1 small to medium chicken (whole)',
        '12 cups chicken broth',
        '3–4 slices of fresh ginger (whole)',
        '1 medium whole brown onion, peeled',
        '1 tbsp salt or more (to taste)',
        'Fish sauce, to taste',
        'Serving:',
        'Pho rice noodles (often called bánh phở, rice noodles, or rice sticks)',
        'Chopped cilantro and green onion',
        'A few fresh basil leaves, torn',
        'Fresh bean sprouts',
        'Thinly sliced brown or white onion (several pieces per serving)',
        'Hoisin sauce (1 tsp per serving, or to taste)',
        'Lime (squeezed into broth before eating)',
        'Jalapeños, serranos, or other chilli peppers',
        'Sriracha or similar chilli sauce',
        'Additional fish sauce',
      ],
      instructions: [
        "Combine ingredients for seasoning pouch in a small strainer or a pouch made from cheesecloth and twine.",
        "In a large stock pot, boil soup ingredients together with seasoning pouch until the chicken is thoroughly cooked.",
        "Remove the chicken and strain broth back into the pot for additional simmering. Once the chicken is cool, pull apart the meat into bite sized pieces and discard bones.",
        "In a separate pot, boil the pho noodles in sufficient water. Stop when they're no longer chewy (basically the way you'd boil spaghetti). Make sure you don't overdo it or the noodles will fall apart and you'll end up with porridge. When done, pour the noodles into a colander and rinse them with lukewarm water. Then, leave them to drain.",
        "Once the noodles have drained, add them to a bowl. Combine the chicken, serving ingredients, and enough broth to cover the noodles.",
      ],
    ));

    recipes.add(RecipeModel(
      name: 'Banh Xeo',
      iconPath: 'assets/icons/3.jpg',
      description: 'Traditional Vietnamese beef noodle soup.',
      about:
          "Phở bò (Vietnamese beef noodle soup) could easily be called Vietnam's national dish. Most often served in the early morning, it is available on any street corner, everywhere in Vietnam, all day, and is a staple of most Vietnamese restaurants outside of the country. The broth is the star of this meal and can vary from North to South and is in some cases a closely guarded family secret. Experimenting with the ingredients is a must as long as they are traditionally South-East Asian in origin.",
      ingredients: [
        'Sweet and Spicy Vietnamese Dipping Sauce:',
        '2 large garlic cloves, coarsely chopped',
        '1 Thai chile, thinly sliced',
        '1/4 cup plus 2 tablespoons sugar',
        '1/4 cup unseasoned rice vinegar',
        '1/2 cup fish sauce',
        '1 1/2 cups water',
        'Crêpes:',
        '1/2 cup dried mung beans',
        '1 cup unsweetened coconut milk, stirred before using',
        '2 cups white rice flour',
        '1 cup cornstarch',
        '4 cups water',
        '2 scallions, thinly sliced',
        '1 1/2 teaspoons turmeric',
        'Kosher salt',
        'Filling:',
        'Vegetable oil, for pan-frying',
        '3/4 pound boneless pork loin, cut into 1/4-inch-thick slices',
        '3/4 pound medium shrimp, shelled, deveined, and halved lengthwise',
        '1 medium white onion, halved lengthwise and thinly sliced',
        '3 cups bean sprouts',
        'Red leaf lettuce, for serving',
        'Mint leaves, for serving',
      ],
      instructions: [
        'Make the dipping sauce:',
        'In a large mortar, pound the chopped garlic with the chile. Add the sugar and mash the ingredients to a paste, adding a few drops of the rice vinegar as needed to moisten the mixture. Pound until the sugar is completely dissolved. Stir in the remaining rice vinegar along with the fish sauce and the water and transfer the dipping sauce to a bowl.',
        'Make the bánh xèo batter:',
        'In a small bowl, soak the dried mung beans in warm water until they are softened, about 30 minutes. Drain the beans and transfer them to a blender. Add the coconut milk and puree until very smooth.',
        'Transfer the mung bean puree to a large bowl and whisk in the white rice flour, cornstarch, water, scallions, and turmeric, and season lightly with salt. Let the batter rest for at least 20 minutes or refrigerate overnight.',
        'Make the filling and crêpes',
        'Heat 1 teaspoon of vegetable oil in a 10-inch nonstick skillet. Add a few slices of pork, a couple of shrimp, and a few slivers of white onion and cook for 30 seconds.',
        'Stir the batter and pour 2/3 cup of it into the pan; tilt and swirl the pan to coat the bottom with a very thin layer of batter, letting it come up the side of the pan. Scatter 1/4 cup of the bean sprouts over the bánh xèo and drizzle 2 teaspoons of vegetable oil around the edges.',
        'Cover the skillet and cook over moderately high heat until the bottom of the bánh xèo is golden and crisp, about 2 minutes.',
        'Slide the bánh xèo onto a plate. Serve with lettuce leaves, mint, and the Sweet and Spicy Vietnamese Dipping Sauce.',
        'Repeat with the remaining ingredients, serving the bánh xèo as soon as they are cooked.',
      ],
    ));

    return recipes;
  }
}

# AIMTest
Making a cat app (for a test).

The CDS Field Guide is setup to run on the latest version of XCode (26) and should be run on a simulator running the latest version of iOS. If this were a production app, I would spend the time to ensure backwards compatibility with previous iOS versions.

The CDS Field Guide is currently setup to run a search for 23 cat results, limited to results featuring cat breed data (name, weight, origin, lifespan, etc) for user experience. The provided API endpoint returned a lot of results with no breed data.

I had to create a new API key, as the provided key did not return search results with breed data. I wanted the app to provide a pleasing user experience and having every cat say "name unavailable" was not a pleasing user experience. The same goes for the details view. It would be no fun if most of the cats had no data.

Upon running the app, the user will be presented with a loading screen while the data is downloaded and processed. Once the data is processed, the list with populate with the results. The results show an image of a cat and the cat name. Images are loaded asynchronously. If an image is unavailable, the image will display a red square. If given more time, I would provide a more elegant error handling that gave more info to the user.

Clicking on a cat list item will take the user to the cat details view where they will be presented with the cat's name, a larger sized image of the cat, and details about the cat including: weight, origin, lifespan, temperament, and a link to the cat's wikipedia page. If this were a production app with more of a runway, I would localize the weight to the user's preferred type (imperial/metric) or add a setting to toggle between the two. If the cat details do not have a wikipedia link, the link will be replaced with a wikipedia link for a general cat search.

Bonus: The CDS Field Guide features a lightly-contrasted dark and light mode color scheme based on the user's device settings.

Things I would add/change if given more time:
1. Persist the list so that navigating back did not reload the list.
2. Localization for Spanish language, at least.
3. More elegant error handling for loading the list data, details data, and images, including a retry button if data fetching fails for some reason.
4. The API allows for favoriting... that would've been fun to implement for the user, including a list screen where favorites can be viewed.
5. Sorting and filtering.
6. Breed specific search functionality on list screen.
7. More thoughtful color/font design, but it's at least pleasant in its current iteration.

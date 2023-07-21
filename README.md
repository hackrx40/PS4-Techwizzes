# PS4-Techwizzes
App name - "InsightInvest"

"Uncover the power of informed decisions. Empowering you with invaluable market insights to navigate the investment landscape with confidence and wisdom."


## Problem statement ?

Bajaj Financial Securities Limited (BFSL) is a 100% subsidiary of Bajaj Finance Limited (BFL). BFSL is heavily leveraging technology to create a unique and real-time trading experience for its customers and partners. BFSL trade applications (Mobile and Web) has a Watchlist feature to track scrips changing prices during market hours. Currently we show only +/- percent(%) change in prices. We want to include chart images along with current prices against each scrip.

## Our solution -

Our application employs a real-time rendering approach to display chart snapshots fetched from our repository. By doing so, we optimize bandwidth usage and minimize internet data consumption for our users, eliminating the need to download large image files.

One of the key features of our app is the Comprehensive Watchlist Chart, which offers users a comprehensive view of their selected stocks or assets' performance over the past three months. This holistic overview allows users to gain valuable insights into the historical trends and patterns of their investments, aiding in making informed decisions.

Moreover, our app provides invaluable assistance in designing an effective investing portfolio. By analyzing past data, the application identifies top gainers and losers, enabling users to make data-driven choices while constructing their investment portfolios. This ensures that users are well-equipped to maximize their investment potential and achieve their financial goals.

With our user-friendly interface and powerful analytical tools, users can confidently navigate the complexities of the financial markets. Whether users are seasoned investors seeking to refine their strategies or newcomers looking to embark on their investment journey, our app is designed to cater to their diverse needs and guide them towards success.

Emphasizing the importance of data accuracy and reliability, we have incorporated trusted data sources and continuously update our information to provide the most up-to-date insights. Our dedication to delivering a seamless user experience is evident through the thoughtful implementation of features, providing users with an intuitive and rewarding journey within the realm of investing.

In summary, our application offers real-time rendering of chart snapshots, presents a comprehensive watchlist chart, and assists users in creating an effective investing portfolio through the analysis of past data. By combining advanced technology with user-oriented design, we empower our users to make well-informed investment decisions and pursue financial prosperity with confidence.


## Working of our solution -

Our solution, called "InsightInvest," is a user-friendly mobile application designed to provide real-time stock market data and analysis to its users. The app's workflow begins with a splash screen that appears when the user opens the application. Upon completion of the authentication process, the user is directed to a sign-in screen where they can input their details, following the standard procedure seen in many other applications.

Once authenticated, the user is led to the home screen, which displays the current date and a profile bar. Additionally, the home screen showcases the most active stocks of the current day up to that specific time. To offer a comprehensive perspective on stock performance, the app includes a section named "Today's Performance," listing the stocks that have shown the best performance up to that particular time. This approach recognizes that the most active stocks might not necessarily be the best-performing ones on a given day.

The bottom section of the app comprises two more screens, bringing the total to three, including the home screen. The second screen is dedicated to displaying "All Stocks," providing users with a wide variety of choices without any restrictions. This unrestricted selection allows users to explore various stocks actively listed in the market. The third screen is the "Watchlist," where users can personalize their investments and interests by listing specific stocks. Clicking on any stock in the watchlist provides the user with live data for that particular stock. In case the market is closed, a straight line is displayed. Users can also zoom in on charts for a better look.

The server-side of the application gets activated once the authentication process is completed successfully. The server's API fetches real-time stock market data, converts it into charts or graphs, and then converts these visuals into strings using image base64 format. This conversion is done to optimize processing speed and response time, ensuring smooth user experience.

On the backend, the data is processed, and the components include time, script name (stock name), and prices. The information gathered is utilized to update the graph screen in the watchlist section, showcasing historical data. Simultaneously, the real-time data screen keeps updating according to the standard stock update frequency, typically aligning with actual market hours. The constant flow of data is achieved through the interaction and integration of feedings and plugins between the backend and server.

In conclusion, InsightInvest is a sophisticated yet easy-to-use stock market application that delivers real-time data, insightful graphs, and personalized watchlists to empower users with valuable information for their investments. The seamless interplay between the frontend and backend ensures a smooth and dynamic user experience, making InsightInvest an essential tool for stock market enthusiasts and investors.

## Dependencies-

Assuring the accuracy and dependability of market data, putting in place strong security measures to safeguard private financial data, scaling the system to handle growing user and data volume, adhering to applicable regulations, and incorporating user feedback for iterative improvements are all things to keep in mind for the Trade Amplifier system and its data.
In order to guarantee data accuracy, security, and compliance while continually improving the system's performance based on user input, it is crucial to engage with domain experts and adhere to industry best practises.
To ensure the effectiveness of all the mentioned aspects, we have chosen to utilize the Flutter framework. This decision enables us to achieve the required speed and accuracy, crucial for maintaining the integrity of invigilation processes.


## Technologies -

- Frontend Framework: Flutter

- Language: Dart, JavaScript

- Backend: Node.js, Express.js

- Database: MongoDB

- Library: Fl_Charts, Screenshot

- Cloud Repository: Cloudinary

## Prerequisites -

To run any Android application built with Flutter you need to configure the enviroments in your machine, you can do this following the the tutorial provided by Google in Flutter website

- Flutter SDK

- Android Studio (to download Android SDK)/ VS-code

- Xcode (for iOS develop only)

- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio etc)

- A little knowledge of Dart and Flutter

##   Acceptance Criteria Coverage -

- The system has been thoughtfully designed to cater to a wide range of requirements, seamlessly accommodating requests from 1 to 50 scripts.

- The system ensures that the requested charts are retrieved and delivered in the exact sequence specified by the watchlist, maintaining the desired order.

 - Historical data from the past three months, combined with real-time updates, is processed to generate accurate charts, which are then stored in a repository.

- When retrieving the charts, they are merged together in the same order as requested, allowing users to view a consolidated representation of their selected scripts.

- As to stay up-to-date with price changes, the system continuously updates the charts in the repository and provides new charts to the client's watchlist as needed.


## Setup -

To run the app you need to have an online emulator or a plugged device and run the following command in the root of the application.

- Android

       flutter run

- iOS (MAC Only)


      flutter run

## Future endeavor -

We are dedicated to constantly improving our platform to offer an unmatched experience as part of our unrelenting quest to empower consumers in making educated investing decisions. The launch of Multiple Watchlists is one of the intriguing new features we are working on. Users will be able to establish and maintain several watchlists thanks to this improvement, which will improve organisation and make it simple to compare past performance across various investment alternatives. The ability to compare the previous performances allows clients to get important insights and make wiser decisions.We also understand the need of risk analysis in making investing decisions. Each watchlist in our system will have a separate Risk Profile component to meet this demand. Clients will be shown a wide range of important risk ratios in this area, including alpha, beta, variance, standard deviation, and Sharpe ratio. With access to this crucial information, customers may learn more about the possible returns and dangers of their investments, empowering them to make decisions with confidence and clarity.Our dedication for making sure that our users have access to the most reliable and user-friendly platform possible motivates us to always innovate and develop. We are dedicated to transform the investing environment with these planned improvements, giving our users the tools they need to successfully navigate the financial markets and reach their financial objectives.

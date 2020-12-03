# news_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

There are two screen in news_app project, namely: NewsPage and NewsDetail

# NewsPage
Below are element displayed in List Tile
- Image
- Title
- Name

Initially, 20 records are fetched from backend and dispalyed on listView using pagination. 
On scrolling the list, fetches the next 20 records and continue to fetch till all records are presented on the screen.

Listview is sorted using name element in lowercase.

Records are filtered using name element in the ListView.

Records are displayed in ListView using Bloc pattern.

Navigate to detail screen, clicking on list tile.

# NewsDetail
The detail screen shows all element for the selected record.

Click on the bottom URL to check the records on the mobile browser.

# Limitataion:
Due to pagination we can sort the records in slot of 20.

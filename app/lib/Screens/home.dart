class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Featured',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16/9,
              ),
              items: [
                Image.network('https://example.com/image1.jpg', fit: BoxFit.cover),
                Image.network('https://example.com/image2.jpg', fit: BoxFit.cover),
                Image.network('https://example.com/image3.jpg', fit: BoxFit.cover),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Category 1'),
                  leading: Icon(Icons.category),
                  onTap: () {
                    // TODO: Navigate to category screen
                  },
                ),
                ListTile(
                  title: Text('Category 2'),
                  leading: Icon(Icons.category),
                  onTap: () {
                    // TODO: Navigate to category screen
                  },
                ),
                ListTile(
                  title: Text('Category 3'),
                  leading: Icon(Icons.category),
                  onTap: () {
                    // TODO: Navigate to category screen
                  },
                ),
                // ...
              ],
            ),
          ),
        ],
      ),
    );
  }
}


## Features

### Home Page
- Bottom navigation (Home, Favorites, Cart, Profile)
- Hardcoded banners
- Categories fetched from API
- Products fetched from API displayed in a grid
- Loading animations (Shimmer) while fetching data

### Cart Page
- Add/remove products from the cart
- Display product name, image, price, and quantity
- Total price calculation

### Product Details Page
- Navigate from Home page to product details
- Shows product image, title, price, category, and description

### Favorites
- Add/remove products to favorites

### Profile Page
- Localization (English + Arabic)
- Light/Dark Theme switching

---

## Screens
1. **Home Page** – displays banners, categories, and products  
2. **Cart Page** – shows all items in the cart with quantity and total price  
3. **Product Details Page** – shows detailed info about a single product  
4. **Favorite Page** – shows user favorite products  
5. **Profile Page** – includes localization and theme change  

---

## APIs Used
- **Products:** `https://fakestoreapi.com/products`  
- **Product by ID:** `https://fakestoreapi.com/products/1`  
- **Categories:** `https://fakestoreapi.com/products/categories`  

> **Note:** API does NOT support pagination or language change.  

Error handling is implemented for network failures and invalid responses.

---

## Architecture & State Management

### Architecture
- **Clean Architecture**  
  - `features/` contains feature-specific data, repositories, and presentation  
  - `core/` contains shared resources, helpers, theming, and widgets  

### State Management
- **Bloc/Cubit**  
  - Chosen for clear separation between UI and business logic  
  - Handles multiple states (loading, success, failure)  
  - Scales well with larger projects  

---

## Setup Instructions

1. Clone the repository:

git clone https://github.com/ayaessam138/ntgtask.git

2. Install dependencies:
flutter pub get

3. Run the app:
flutter run

## Extra Features Implemented

* Product Details Page with hero animation
* Shimmer Loading Indicators
* Light/Dark Mode Support using Theme Cubit
* Localization (English + Arabic)
* Dependency Injection via Get It

---

## Folder Structure

```
features/
│
├─ home/
│   ├─ data/
│   │   ├─ model/
│   │   ├─ repo/
│   │   └─ data_source/  # Remote/local
│   ├─ presentation/
│   │   ├─ controller/   # Bloc/Cubit
│   │   ├─ screens/
│   │   └─ widgets/
│
├─ cart/
│   └─ ... (same structure)
│
├─ product_details/
│   └─ ... (same structure)


## Screenshots
https://drive.google.com/open?id=17tjOSuvASLtJKWAFLUVCaIyJRvzGQhKn&usp=drive_copy
https://drive.google.com/open?id=1jcinhvHHkUuWBsJgZR6OV-FNQxkjBI3z&usp=drive_copy
https://drive.google.com/open?id=1H-dQuQdYo4cQLF5tcZYxRTvZoM0d2GzQ&usp=drive_copy
https://drive.google.com/open?id=1RPr3Km4X_ZJfPbql6V_Ec6VMIe4EyoFF&usp=drive_copy
https://drive.google.com/open?id=1UZnOAtxDKhcPf1Dq46inpFOrbY17VJG6&usp=drive_copy
https://drive.google.com/open?id=1kEzZHKcZrcsDxRGVIcGXIJ2ZA-NRJDGI&usp=drive_copy
https://drive.google.com/open?id=1ru2MZ7F56UC68GqdCCeOw14cSbMe-2tH&usp=drive_copy
https://drive.google.com/open?id=1RDB5w9iU1DN9MWctFdtqD7kdKGwwdjjY&usp=drive_copy
https://drive.google.com/open?id=1Hsc3Qkyb3_EP8k5ww3oWwzYM2lEma4fw&usp=drive_copy
https://drive.google.com/open?id=1Z9z_6HCkkifw7lWgsqBvzJy6Y9gTpE20&usp=drive_copy
https://drive.google.com/open?id=1skCPINjdcE0Wv53Qh9tCXI7kqQckqYg0&usp=drive_copy
https://drive.google.com/open?id=10jGzr-oE1TLtCsRPxKRHGvIHDsVtxzOZ&usp=drive_copy
https://drive.google.com/open?id=1ITRsvdAAvQTgSRltXwem4HILe-lmSuYr&usp=drive_copy




---

## State Management Reasoning

* Bloc/Cubit ensures **clear separation of UI and business logic**
* Handles **loading, success, failure states** efficiently
* Scalable and maintainable for larger projects

---

## Known Limitations

* API does not support pagination
* API does not support multi-language responses



```

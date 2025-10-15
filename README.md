

### Home Page
- Bottom navigation (Home, Favorites, Cart, Profile)
- Hardcoded banners
- Categories fetched from API
- Products fetched from API displayed in a grid
- Loading animations (Shimmer) while fetching data

### Cart Page
- empty cart from delete icon
- Display product name, image, price, and quantity
- Total price calculation
- add product to Favorite

### Product Details Page
- Navigate from Home page to product details
- Shows product image, title, price, category, and description
- -add product to Favorite
-  add product to cart

### Favorites
- Show/remove products to favorites

### Profile Page
- Localization (English + Arabic)
- Light/Dark Theme switching



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
![Screenshot_20251015_163715](https://github.com/user-attachments/assets/28c2cfb5-1661-4a45-a562-44ba00b92f87)
![Screenshot_20251015_163729](https://github.com/user-attachments/assets/4d79e8e1-f966-42ae-baf8-326080f4f946)
![Screenshot_20251015_163740](https://github.com/user-attachments/assets/78b9911c-a152-42f9-a9a1-213a6cb0090d)
![Screenshot_20251015_163846](https://github.com/user-attachments/assets/a63aaa84-5dae-4104-bcc8-08b8233ce0a9)

![Screenshot_20251015_163933](https://github.com/user-attachments/assets/98be0ee5-ad9e-4d0e-9035-d699d1912d6e)
![Screenshot_20251015_163948](https://github.com/user-attachments/assets/6bc54c52-7b72-482e-ba7f-bf11da5fd210)
![Screenshot_20251015_164149](https://github.com/user-attachments/assets/b2fcf983-14f5-4663-b1c9-9c32ff9983c3)

![Screenshot_20251015_164130](https://github.com/user-attachments/assets/07e32e75-cda1-4bca-8a7e-225545f3fbbe)
![Screenshot_20251015_163955](https://github.com/user-attachments/assets/bcc67ab2-a419-4162-b9ed-7a837a18033a)
![Screenshot_20251015_164123](https://github.com/user-attachments/assets/3d0c427f-5cc1-4d8c-8fce-c7eb15f591e8)
![Screenshot_20251015_164105](https://github.com/user-attachments/assets/7ae16655-90e8-4c14-9266-4c5d971868b4)
![Screenshot_20251015_164026](https://github.com/user-attachments/assets/8b004cb0-1361-4847-b51b-90acad03d8fc)
![Screenshot_20251015_163951](https://github.com/user-attachments/assets/b49f5391-b11d-4be1-ac7f-ce594b24ac81)
![Screenshot_20251015_163913](https://github.com/user-attachments/assets/cbf837bd-d431-4e25-9c83-94c432863eef)
![Screenshot_20251015_163859](https://github.com/user-attachments/assets/0a761f02-46cf-45a2-9cd2-5cb6e52e9254)
![Screenshot_20251015_163840](https://github.com/user-attachments/assets/ab50907f-a14e-4f86-9a95-c3049eed7645)
![Screenshot_20251015_164145](https://github.com/user-attachments/assets/b58d51a4-caa9-4656-b0f6-ae4fa5771a2a)
![Screenshot_20251015_164135](https://github.com/user-attachments/assets/079547ff-58e8-4d0b-ba6e-1a909addf858)

![Screenshot_20251015_164139](https://github.co![Screenshot_20251015_163721](https://github.com/user-attachments/assets/707960e4-62e5-420d-817d-1a616ed25339)
m/user-attachments/assets/f3d9d610-6398-4111-9ed6-a627aad9f04d)

## State Management Reasoning

* Bloc/Cubit ensures **clear separation of UI and business logic**
* Handles **loading, success, failure states** efficiently
* Scalable and maintainable for larger projects

---

## Known Limitations

* API does not support pagination
* API does not support multi-language responses



```

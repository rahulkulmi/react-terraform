
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import ErrorPage from './pages/Error';
import HomePage from './pages/Home';
import React from 'react';
import ProductsPage from './pages/Products';
import ProductsDetail from './pages/ProductDetail';
import RootLayout from './pages/Root';


const router = createBrowserRouter([
  { path: '/', element: <RootLayout/>,
  errorElement: <ErrorPage/>,
  children: [
    { index: true, element: <HomePage/> }, //alternative of path:''
    { path: 'products', element: <ProductsPage/>  },
    { path: 'products/:productId', element: <ProductsDetail/>  },
  ]},
 
]);

function App() {
  return (
      <RouterProvider router={router}/>
  );
}

export default App;

import { lazy, Suspense } from 'react';
import { Navigate } from 'react-router-dom';
import { sellerRoutes } from './seller.routes';

// Lazy load the Index page
const IndexPage = lazy(() => import('@/pages/Index'));

// Create a simple loading component
const LoadingFallback = () => <div className="flex justify-center items-center min-h-screen">Loading...</div>;

// Main routes configuration
export const routes = [
  {
    path: '/',
    element: (
      <Suspense fallback={<LoadingFallback />}>
        <IndexPage />
      </Suspense>
    ),
  },
  ...sellerRoutes,
];

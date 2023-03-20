import React from 'react';
import { useParams, Link} from 'react-router-dom';

const ProductDetail = () => {
    const params = useParams();

    return (
        <>
        <h3>Product detail </h3>
        <p>{params.productId}</p>
        <Link to=".." relative="path">Back</Link>
        </>
    );
};

export default ProductDetail;
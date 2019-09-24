function find_distribution(image,range_l,range_h)
    distribution = zeros(size(image));
    for x=1:size(image,1)
        for y=1:size(image,2)
            if(image(x,y)>range_l && image(x,y)<range_h)
                distribution(x,y)=1;
            end
        end
    end
    imshow(distribution);
    
end
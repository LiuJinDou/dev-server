def oss_o_put(image_name, imageurl):
    image_b = requests.get(url=imageurl, proxies=proxies).content
    response = client.put_object(
        Bucket=Bucket_name,
        Body=image_b,
        Key=image_name,
        EnableMD5=False
    )
    print('response,etag:',response['ETag'],Bucket_name)
    if response['ETag'] is None:
        for _ in range(3):
            time.sleep(3)
            print('再次上传图片-response:', response)
            if oss_put_i(image_name, imageurl):
                break

    return image_name
function recordProgress(progress)
{
    if (Array.isArray(progress)) {
        let strData = JSON.stringify(progress);
        try {
            SD.SetDataChunk(strData); // Try API method   
        } catch(e) {
            console.log('The Api Method is not available', e);
        } finally {
            storeLocalStorage(strData); // Always record data in localStorage

        }
    } else {
        throw 'Parameter is not an Array';
    }
};

document.querySelector('button').addEventListener('click', recordProgress);


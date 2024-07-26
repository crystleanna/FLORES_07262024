export class VideoPayload {
    title !: string;
    description !: string;
    file !: string; //Base64
    category : string | null | undefined;
    fileName !: string;
}

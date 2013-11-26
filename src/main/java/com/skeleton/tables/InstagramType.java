package com.skeleton.tables;

public enum InstagramType {
    IMAGE, VIDEO;

    public static InstagramType getFromInt(int t) {
        for ( InstagramType type : InstagramType.values() ) {
            if ( type.ordinal() == t ) {
                return type;
            }
        }
        return null;
    }
}

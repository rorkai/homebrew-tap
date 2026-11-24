# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.4.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.4.0/asc_7.4.0_macOS_arm64'
      sha256 '6ef5999425a5e26e68f5d1ad19615026fa19944f62797908a72535d6bc15be2b'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.4.0/asc_7.4.0_macOS_amd64'
      sha256 'aaabc20db1f1927fcda759a7975a04bc77af11571fa0b7b5f8f8f5622f58a90f'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
